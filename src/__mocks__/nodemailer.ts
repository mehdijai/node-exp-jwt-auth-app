import nodemailer from 'nodemailer';
// pass it in when creating the mock using getMockFor()
const nodemailermock = require('nodemailer-mock').getMockFor(nodemailer);
// export the mocked module
module.exports = nodemailermock;