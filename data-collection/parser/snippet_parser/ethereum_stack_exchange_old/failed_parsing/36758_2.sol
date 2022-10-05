const listenForEvent = event => new Promise((resolve, reject) => {
    event.watch((error, response) => {
        if (!error) {
            resolve(response.args)
        } else {
            reject(error)
        }
        event.stopWatching()
    })
})
