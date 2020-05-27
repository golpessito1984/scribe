const { environment } = require('@rails/webpacker')

const webpack = require("webpack")

environment.plugins.append("Provide", new webpack.ProvidePlugin({

    // $: 'jquery',
    $: 'jquery/src/jquery',
    // jQuery: 'jquery',
    jQuery: 'jquery/src/jquery',

    Popper: ['popper.js', 'default']

}))

// environment.plugins.prepend('Provide',
//     new webpack.ProvidePlugin({
//         $: 'jquery/src/jquery',
//         jQuery: 'jquery/src/jquery'
//     })
// )

module.exports = environment
