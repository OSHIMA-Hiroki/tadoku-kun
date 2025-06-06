// Stimulus loading helpers
export function eagerLoadControllersFrom(under, application) {
  const controllerFilenames = Object.keys(parseImportmapJson()).filter(filename => filename.match(new RegExp(`^${under}/.*_controller$`)))

  controllerFilenames.forEach(filename => {
    const controllerName = filename
      .replace(new RegExp(`^${under}/`), "")
      .replace("_controller", "")
      .replace(/\//g, "--")

    import(filename).then(module => {
      application.register(controllerName, module.default)
    })
  })
}

export function lazyLoadControllersFrom(under, application) {
  lazyLoadControllersFrom(under, application)
}

function parseImportmapJson() {
  return JSON.parse(document.querySelector("script[type=importmap]").text).imports
}