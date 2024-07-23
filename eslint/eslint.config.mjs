// =====================
// === ESLint Config ===
// =====================

import js from '@eslint/js';
import stylistic from '@stylistic/eslint-plugin'
import globals from 'globals';

export default [
  // extend recommended config
  js.configs.recommended,

  {
    plugins: {
      // stylistic rules
      '@stylistic': stylistic
    },

    languageOptions: {
      // global variables
      globals: {
        ...globals.node,
        ...globals.browser,
      },
    },

    rules: {
      // ==============
      // === Unused ===
      // ==============

      'no-unused-vars': 'warn',
      'no-unused-labels': 'warn',
      'no-unused-expressions': 'warn',
      'no-unused-private-class-members': 'warn',

      // ===================
      // === Punctuation ===
      // ===================

      // curly braces
      curly: 'warn',

      // semicolons
      '@stylistic/semi': 'warn',

      // =================
      // === Variables ===
      // =================

      // let and const
      'no-var': 'warn',

      // declare one variable per line
      'one-var': ['warn', 'never'],

      // prefer const variables
      'prefer-const': 'warn',

      // =============
      // === Style ===
      // =============

      // camelcase identifiers
      camelcase: 'warn',

      // prefer single quotes
      '@stylistic/quotes': [
        'warn', 'single',
        { avoidEscape: true }
      ],

      // uncapitalized comments
      'capitalized-comments': ['warn', 'never'],

      // prefer double quotes in jsx
      '@stylistic/jsx-quotes': 'warn',

      // spaced comments
      '@stylistic/spaced-comment': [
        'warn', 'always',
        { block: { balanced: true } }
      ],

      // spaces inside objects
      '@stylistic/object-curly-spacing': ['warn', 'always'],

      // ==============
      // === Syntax ===
      // ==============

      // triple equals
      eqeqeq: 'warn',

      // dot notation
      'dot-notation': 'warn',

      // no fallthrough for case
      'no-fallthrough': 'warn',

      // object shorthands
      'object-shorthand': 'warn',

      // no nested ternary expressions
      'no-nested-ternary': 'warn',

      // require default params to be last
      'default-param-last': 'warn',

      // no unecessary ternary expressions
      'no-unneeded-ternary': 'warn',

      // operator assignment shorthands
      'operator-assignment': 'warn',

      // parentheses around iifes
      '@stylistic/wrap-iife': 'warn',

      // no duplicate imports from same module
      'no-duplicate-imports': 'warn',

      // prefer arrow callbacks
      'prefer-arrow-callback': 'warn',

      // no extra semicolons
      '@stylistic/no-extra-semi': 'warn',

      // prefer exponentiation operator
      'prefer-exponentiation-operator': 'warn'
    }
  }
];
