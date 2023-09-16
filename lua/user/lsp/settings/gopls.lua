return {
    cmd = {'gopls'},
    filetypes = {'go', 'gomod', 'gowork', 'gotmpl'},
    rootdir = require("lspconfig/util").root_pattern('go.work', 'go.mod', '.git'),
}
