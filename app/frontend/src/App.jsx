import { useState, useMemo } from "react";
import { motion, AnimatePresence } from "framer-motion";
import { FiBookOpen } from "react-icons/fi";
import { InputForm } from "./components/InputForm";
import { AyahCard } from "./components/AyahCard";

const PARTICLE_COLORS = ["#6366f1", "#0ea5e9", "#8b5cf6", "#a78bfa", "#f472b6"];
const rand = (min, max) => Math.random() * (max - min) + min;

export default function App() {
  const [ayahData, setAyahData] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");


  const particles = useMemo(
    () =>
      Array.from({ length: 28 }, (_, i) => ({
        id: i,
        size: rand(3, 7),
        left: `${rand(0, 100)}%`,
        delay: rand(0, 12),     
        duration: rand(12, 28),  
        color: PARTICLE_COLORS[i % PARTICLE_COLORS.length],
      })),
    []
  );

  const handleFetchAyah = async ({ surah, ayah }) => {
    setError("");
    setAyahData(null);
    setLoading(true);
    try {
      const params = new URLSearchParams({ surah, ayah }).toString();

      const baseUrl = import.meta.env.VITE_API_URL || "http://localhost:5002";

      const response = await fetch(`${baseUrl}/api/ayah?${params}`);

      if (!response.ok) {
        const data = await response.json().catch(() => ({}));
        throw new Error(data.error || "Unable to retrieve the verse.");
      }
      const data = await response.json();
      setAyahData(data);
    } catch (err) {
      setError(err.message || "Something went wrong.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="relative min-h-screen overflow-hidden bg-gradient-to-br from-slate-950 via-slate-900 to-slate-950 text-slate-50">

      <motion.div
        className="pointer-events-none absolute -top-40 -left-40 h-[28rem] w-[28rem] rounded-full bg-indigo-500/25 blur-[120px]"
        animate={{ opacity: [0.25, 0.7, 0.25], scale: [1, 1.15, 1], x: [0, 40, 0] }}
        transition={{ duration: 10, repeat: Infinity, ease: "easeInOut" }}
      />

      {particles.map((p) => (
        <motion.span
          key={p.id}
          className="particle"
          style={{
            width: p.size,
            height: p.size,
            left: p.left,
            bottom: "-10px",
            background: p.color,
            boxShadow: `0 0 ${p.size * 4}px ${p.color}`,
            borderRadius: "50%",
            position: "absolute",
            pointerEvents: "none",
          }}
          animate={{
            y: ["0vh", "-100vh"],
            opacity: [0.2, 0.8, 0.2],
            scale: [0.8, 1.2, 0.8],
          }}
          transition={{
            repeat: Infinity,
            repeatType: "loop",
            duration: p.duration, 
            delay: p.delay,       
            ease: "easeInOut",
          }}
        />
      ))}

      <main className="relative z-10 flex min-h-screen items-center justify-center px-4 py-10">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 1 }}
          className="rainbow-border mx-auto w-full max-w-xl md:max-w-2xl"
        >
          <div className="glass-card flex flex-col gap-6 rounded-3xl p-8 sm:p-10">

            <div className="text-center">
              <h1 className="glow-text flex items-center justify-center gap-3 text-2xl font-bold sm:text-3xl">
                <FiBookOpen className="h-7 w-7 text-indigo-300" />
                <span className="gradient-text">Quran Ayah Explorer</span>
              </h1>
              <p className="mt-2 text-sm text-slate-400">Explore divine verses with clarity.</p>
            </div>

            {error && (
              <div className="rounded-xl bg-red-500/10 px-4 py-3 text-sm text-red-200">
                {error}
              </div>
            )}

            <InputForm onSubmit={handleFetchAyah} loading={loading} />

            <AnimatePresence>
              {loading && (
                <motion.div className="text-center text-xs text-indigo-300">
                  Retrieving words...
                </motion.div>
              )}
            </AnimatePresence>

            <AnimatePresence mode="wait">
              {ayahData && <AyahCard data={ayahData} />}
            </AnimatePresence>

          </div>
        </motion.div>
      </main>
    </div>
  );
}
