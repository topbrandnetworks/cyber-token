module.exports = {
    networks: {
        ganache: {
            host: "127.0.0.1",
            port: 5777,
            network_id: "*"
        }
    },

    mocha: {},

    compilers: {
        solc: {
            version: "0.8.4"
        }
    },

    db: {
        enabled: false
    }
};
