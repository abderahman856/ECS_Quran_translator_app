import { useState } from "react";
import { motion } from "framer-motion";
import { FiSearch } from "react-icons/fi";

export const InputForm = ({ onSubmit, loading }) => {
  const [surah, setSurah] = useState("");
  const [ayah, setAyah] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();
    if (!surah || !ayah) return;
    onSubmit({ surah: surah.trim(), ayah: ayah.trim() });
  };

  return (
    <form
      onSubmit={handleSubmit}
      className="mt-4 rounded-3xl bg-slate-950/50 p-6 shadow-xl shadow-indigo-900/30 ring-1 ring-white/10 sm:p-8"
    >
      <div className="grid grid-cols-1 gap-5 sm:grid-cols-2">
        {/* Surah input */}
        <div className="flex flex-col space-y-1.5">
          <label
            htmlFor="surah"
            className="text-xs font-semibold uppercase tracking-wide text-slate-300"
          >
            Surah
          </label>
          <input
            id="surah"
            type="number"
            min="1"
            placeholder="e.g. 2"
            value={surah}
            onChange={(e) => setSurah(e.target.value)}
            className="w-full rounded-2xl bg-white/5 px-4 py-2.5 text-sm text-slate-50 placeholder:text-slate-400/70 shadow-inner shadow-slate-900/40 outline-none focus:border-indigo-400/80 focus:ring-2 focus:ring-indigo-400/50"
          />
          <p className="text-[0.7rem] text-slate-400">
            Choose a surah number from 1 to 114.
          </p>
        </div>

        {/* Ayah input */}
        <div className="flex flex-col space-y-1.5">
          <label
            htmlFor="ayah"
            className="text-xs font-semibold uppercase tracking-wide text-slate-300"
          >
            Ayah
          </label>
          <input
            id="ayah"
            type="number"
            min="1"
            placeholder="e.g. 255"
            value={ayah}
            onChange={(e) => setAyah(e.target.value)}
            className="w-full rounded-2xl bg-white/5 px-4 py-2.5 text-sm text-slate-50 placeholder:text-slate-400/70 shadow-inner shadow-slate-900/40 outline-none focus:border-cyan-400/80 focus:ring-2 focus:ring-cyan-400/50"
          />
          <p className="text-[0.7rem] text-slate-400">
            Enter an ayah number from the selected surah.
          </p>
        </div>
      </div>

      {/* Submit button */}
      <motion.button
        type="submit"
        disabled={loading || !surah || !ayah}
        whileHover={!loading && surah && ayah ? { scale: 1.03, y: -1 } : {}}
        whileTap={!loading && surah && ayah ? { scale: 0.97, y: 0 } : {}}
        className="group relative mt-6 w-full rounded-2xl bg-gradient-to-r from-indigo-500 via-purple-500 to-pink-500 px-6 py-3 text-sm font-semibold text-slate-50 shadow-lg transition hover:shadow-[0_12px_36px_rgba(131,58,180,0.5)] disabled:cursor-not-allowed disabled:from-slate-600 disabled:via-slate-700 disabled:to-slate-800 disabled:shadow-none"
      >
        <span className="absolute inset-0 bg-white/20 opacity-0 transition-opacity group-hover:opacity-20 rounded-2xl" />
        {loading ? (
          <span className="flex items-center justify-center gap-2">
            <span className="h-4 w-4 animate-spin rounded-full border-2 border-white/40 border-t-white" />
            Retrieving your ayah...
          </span>
        ) : (
          <span className="flex items-center justify-center gap-2">
            <FiSearch className="h-4 w-4" />
            Explore Ayah
          </span>
        )}
      </motion.button>
    </form>
  );
};
