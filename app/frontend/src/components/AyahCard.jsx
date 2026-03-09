import { useState } from "react";
import { motion } from "framer-motion";
import { FiStar, FiCopy, FiCheck } from "react-icons/fi";

export const AyahCard = ({ data }) => {
  const {
    surah_name,
    surah_arabic_name,
    surah_number,
    ayah_number,
    arabic,
    translation,
  } = data;

  const [copied, setCopied] = useState(false);

  const handleCopy = async () => {
    const text = `${arabic}

${translation}

(Surah ${surah_name} ${surah_number}:${ayah_number})`;

    try {
      await navigator.clipboard.writeText(text);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    } catch (err) {
      console.error("Copy failed");
    }
  };

  return (
    <motion.section
      initial={{ opacity: 0, y: 16 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.8 }}
      className="mt-3 rounded-3xl border border-indigo-500/20 bg-gradient-to-br from-slate-950/80 via-slate-900/70 to-slate-950/90 p-6 shadow-lg sm:p-7"
    >
      {/* Surah Meta */}
      <div className="text-center">
        <p className="text-xs font-semibold uppercase tracking-[0.22em] text-indigo-300/90">
          Surah {surah_number} • Ayah {ayah_number}
        </p>

        <p className="mt-2 text-lg font-semibold text-slate-100">
          {surah_name}
          {surah_arabic_name && (
            <span className="ml-2 text-indigo-300">
              ({surah_arabic_name})
            </span>
          )}
        </p>
      </div>

      <div className="mt-5 h-px w-full bg-gradient-to-r from-transparent via-indigo-400/40 to-transparent" />

      {/* Arabic Section */}
      <div className="mt-6 text-center">
        <p className="mb-3 text-xs font-semibold uppercase tracking-[0.2em] text-slate-400">
          Arabic
        </p>

        <div className="rounded-2xl bg-slate-950/50 p-5 ring-1 ring-indigo-500/15">
          <p
            dir="rtl"
            className="font-arabic text-2xl leading-relaxed tracking-wide text-indigo-50 sm:text-3xl"
          >
            {arabic}
          </p>
        </div>
      </div>

      {/* Translation Section */}
      <div className="mt-7 text-center">
        <p className="mb-3 text-xs font-semibold uppercase tracking-[0.2em] text-slate-400">
          English Translation (Asad)
        </p>

        <div className="rounded-2xl bg-slate-900/50 p-5 ring-1 ring-white/5">
          <p className="text-sm leading-relaxed text-slate-100 sm:text-base">
            {translation}
          </p>
        </div>
      </div>

      {/* Copy Button */}
      <div className="mt-7 flex justify-center">
        <motion.button
          onClick={handleCopy}
          whileHover={{ scale: 1.02 }}
          whileTap={{ scale: 0.97 }}
          className="inline-flex items-center gap-2 rounded-2xl bg-gradient-to-r from-indigo-400 to-blue-400 px-5 py-2 text-sm font-semibold text-slate-900 shadow-md transition"
        >
          {copied ? (
            <>
              <FiCheck className="h-4 w-4" />
              Copied
            </>
          ) : (
            <>
              <FiCopy className="h-4 w-4" />
              Copy Ayah & Translation
            </>
          )}
        </motion.button>
      </div>
    </motion.section>
  );
};
