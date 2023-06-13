module.exports = {
    "env": {
        "browser": true,
        "commonjs": true,
        "es2021": true
    },
    "extends": "eslint:recommended",
    "parserOptions": {
        "ecmaVersion": "latest"
    },
    "rules": {
        "semi": ["error", "always"],
        "no-unused-vars": "error",
        "no-var": "error",
        "prefer-arrow-callback": "error"
    }
};
