module.exports = (lineman) ->
  files:
    less:
      app: "app/css/**/*.less"
      vendor: "vendor/css/**/*.less"
      generatedApp: "generated/css/app.less.css"
      generatedVendor: "generated/css/vendor.less.css"

  config:
    loadNpmTasks: lineman.config.application.loadNpmTasks.concat('grunt-contrib-less')

    prependTasks:
      common: lineman.config.application.prependTasks.common.concat(["less"])

    less:
      options:
        paths: ["app/css", "vendor/css"]
      compile:
        files:
          "<%= files.less.generatedVendor %>": "<%= files.less.vendor %>"
          "<%= files.less.generatedApp %>": "<%= files.less.app %>"

    watch:
      less:
        files: ["<%= files.less.vendor %>", "<%= files.less.app %>"]
        tasks: ["less", "concat_sourcemap:css"]

