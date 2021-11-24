module.exports = (lineman) ->
  app = lineman.config.application

  files:
    less:
      main: "app/css/main.less"
      app: "app/css/**/*.less"
      vendor: "vendor/css/**/*.less"
      generated: "generated/css/app.less.css"

  config:
    loadNpmTasks: app.loadNpmTasks.concat('grunt-contrib-less')

    prependTasks:
      common: app.prependTasks.common.concat("less")

    less:
      options:
        paths: ["app/css", "vendor/css"]
      compile:
        files:
          "<%= files.less.generated %>": "<%= files.less.main %>"

    concat:
      css:
        src: app.concat.css.src.concat("<%= files.less.generated %>")

    watch:
      less:
        files: ["<%= files.less.vendor %>", "<%= files.less.app %>"]
        tasks: ["less", "concat:css"]

