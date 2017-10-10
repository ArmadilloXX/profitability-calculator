module.exports = {
  test: /.vue$/,
  loader: 'vue-loader',
  options: {
    extractCSS: true,
    preLoaders: {
      i18n: 'yaml-loader'
    },
    loaders: {
      js: 'babel-loader',
      file: 'file-loader',
      i18n: '@kazupon/vue-i18n-loader',
      scss: 'vue-style-loader!css-loader!postcss-loader!sass-loader',
      sass: 'vue-style-loader!css-loader!postcss-loader!sass-loader?indentedSyntax'
    }
  }
}
