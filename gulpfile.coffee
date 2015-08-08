gulp = require "gulp"
plugins = require("gulp-load-plugins")()
browserify = require "browserify"
coffeeify = require "coffeeify"
source = require "vinyl-source-stream"
buffer = require "vinyl-buffer"

gulp.task "scripts", ->
	b = browserify
		entries: "src/retro-achievements.coffee"
		transform: [coffeeify]
		extensions: [".coffee"]

	b.bundle()
		.pipe source "retro-achievements.js"
		.pipe buffer()
		.pipe gulp.dest "dist"
		.pipe plugins.sourcemaps.init()
			.pipe plugins.uglify()
			.pipe plugins.rename suffix: ".min"
		.pipe plugins.sourcemaps.write "."
		.pipe gulp.dest "dist"

gulp.task "default", ["scripts"]

gulp.task "watch", ["default"], ->
	gulp.watch "src/**/*", ["default"]
