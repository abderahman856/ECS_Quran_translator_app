/** @type {import('tailwindcss').Config} */
export default {
  content: ["./index.html", "./src/**/*.{js,jsx,ts,tsx}"],
  theme: {
    extend: {
      fontFamily: {
        arabic: ['"Amiri"', "serif"],
        sans: ['"Inter"', "system-ui", "sans-serif"],
      },
      backgroundImage: {
        "radial-glow":
          "radial-gradient(circle at 20% 20%, rgba(168,85,247,0.4), transparent 50%), radial-gradient(circle at 80% 80%, rgba(236,72,153,0.35), transparent 50%), radial-gradient(circle at 50% 50%, rgba(59,130,246,0.25), transparent 60%)",
        "rainbow-border":
          "linear-gradient(135deg, #f472b6, #a78bfa, #38bdf8, #34d399, #fbbf24, #fb923c, #f472b6)",
      },
      boxShadow: {
        "glow-soft":
          "0 18px 45px rgba(168,85,247,0.35), 0 0 60px rgba(236,72,153,0.25)",
        "glow-rainbow":
          "0 0 30px rgba(168,85,247,0.4), 0 0 60px rgba(236,72,153,0.2), 0 0 90px rgba(56,189,248,0.15)",
        "glow-input":
          "0 0 20px rgba(168,85,247,0.3), inset 0 1px 2px rgba(0,0,0,0.3)",
      },
      animation: {
        "float-slow": "float 8s ease-in-out infinite",
        "float-medium": "float 6s ease-in-out infinite",
        "float-fast": "float 4s ease-in-out infinite",
        "spin-slow": "spin 20s linear infinite",
        "shimmer": "shimmer 3s ease-in-out infinite",
        "gradient-x": "gradient-x 6s ease infinite",
        "pulse-glow": "pulse-glow 3s ease-in-out infinite",
        "bounce-in": "bounce-in 0.6s ease-out",
      },
      keyframes: {
        float: {
          "0%, 100%": { transform: "translateY(0px) rotate(0deg)" },
          "50%": { transform: "translateY(-20px) rotate(3deg)" },
        },
        shimmer: {
          "0%": { backgroundPosition: "-200% 0" },
          "100%": { backgroundPosition: "200% 0" },
        },
        "gradient-x": {
          "0%, 100%": { backgroundPosition: "0% 50%" },
          "50%": { backgroundPosition: "100% 50%" },
        },
        "pulse-glow": {
          "0%, 100%": { opacity: "0.6", transform: "scale(1)" },
          "50%": { opacity: "1", transform: "scale(1.05)" },
        },
        "bounce-in": {
          "0%": { transform: "scale(0.3)", opacity: "0" },
          "50%": { transform: "scale(1.05)", opacity: "0.8" },
          "70%": { transform: "scale(0.9)", opacity: "0.9" },
          "100%": { transform: "scale(1)", opacity: "1" },
        },
      },
    },
  },
  plugins: [],
};
