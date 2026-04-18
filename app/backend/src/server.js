const express = require("express");
const cors = require("cors");
const axios = require("axios");
require("dotenv").config();

const app = express();


const PORT = process.env.PORT || 5000;
const HOST = "0.0.0.0"; 
const QURAN_API_BASE =
  process.env.QURAN_API_BASE_URL ||
  "https://api.alquran.cloud/v1/ayah";

app.use(cors({
  origin: [
    'http://localhost:3000',
    'https://dev.baashe.uk',
    'https://baashe.uk',
    'http://localhost:5173'
  ]
}));
app.use(express.json());


app.get("/", (req, res) => {
  res.status(200).send("Backend is healthy");
});


app.get("/health", (req, res) => {
  res.status(200).json({
    status: "ok",
    uptime: process.uptime(),
    timestamp: new Date().toISOString(),
  });
});


app.get("/api/ayah", async (req, res) => {
  try {
    const { surah, ayah } = req.query;

    if (!surah || !ayah) {
      return res.status(400).json({
        error: "Both 'surah' and 'ayah' query parameters are required.",
      });
    }

    const surahNumber = Number(surah);
    const ayahNumber = Number(ayah);

    if (
      Number.isNaN(surahNumber) ||
      Number.isNaN(ayahNumber) ||
      surahNumber <= 0 ||
      ayahNumber <= 0
    ) {
      return res.status(400).json({
        error: "'surah' and 'ayah' must be positive numbers.",
      });
    }

    const apiUrl = `${QURAN_API_BASE}/${surahNumber}:${ayahNumber}/editions/quran-uthmani,en.asad`;

    const response = await axios.get(apiUrl, {
      timeout: 10000,
    });

    if (!response.data || response.data.code !== 200 || !response.data.data) {
      return res.status(404).json({
        error: response.data?.status || "Ayah not found.",
      });
    }

    const editions = Array.isArray(response.data.data)
      ? response.data.data
      : [response.data.data];

    const arabicEdition =
      editions.find((e) => e.edition?.identifier === "quran-uthmani") ||
      editions[0];

    const englishEdition =
      editions.find((e) => e.edition?.identifier === "en.asad") ||
      editions[1] ||
      editions[0];

    const surahInfo =
      arabicEdition.surah || englishEdition.surah;

    const payload = {
      surah_name:
        surahInfo?.englishName ||
        surahInfo?.name ||
        `Surah ${surahNumber}`,
      surah_number:
        surahInfo?.number ?? surahNumber,
      ayah_number:
        arabicEdition.numberInSurah ??
        englishEdition.numberInSurah ??
        ayahNumber,
      arabic: arabicEdition.text,
      translation: englishEdition.text,
    };

    return res.json(payload);
  } catch (error) {
    console.error("Error in /api/ayah:", error.message);

    if (error.code === "ECONNABORTED") {
      return res
        .status(504)
        .json({ error: "Request to Quran API timed out." });
    }

    if (error.response) {
      const status = error.response.status;
      return res.status(status === 404 ? 404 : 502).json({
        error:
          error.response.data?.status ||
          "Error from Quran API upstream.",
      });
    }

    return res
      .status(500)
      .json({ error: "Internal server error." });
  }
});


app.listen(PORT, HOST, () => {
  console.log(`Backend server is running on ${HOST}:${PORT}`);
  console.log(`Using Quran API Base: ${QURAN_API_BASE}`);
});
