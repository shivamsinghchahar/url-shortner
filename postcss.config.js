module.exports = {
  plugins: [
    require("postcss-import"),
    require("postcss-flexbugs-fixes"),
    require("tailwindcss")("./app/javascript/css/tailwind.js"),
    require("autoprefixer"),
    require("postcss-preset-env")({
      autoprefixer: {
        flexbox: "no-2009",
      },
      stage: 3,
    }),
    process.env.RAILS_ENV === "production" &&
      require("@fullhuman/postcss-purgecss")({
        content: [
          "./app/**/*.html.erb",
          "./app/javascript/components/**/*.js",
          "./app/javascript/layouts/**/*.js",
          "./app/javascript/pages/**/*.js",
        ],
        defaultExtractor: (content) => content.match(/[A-Za-z0-9-_:/]+/g) || [],
      }),
  ],
};
