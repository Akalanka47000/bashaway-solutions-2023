const nodemailer = require('nodemailer');

const transport = nodemailer.createTransport({
    host: "localhost",
    port: "2525",
});

new Promise((resolve, reject)=>{
    transport.sendMail({
        from: {
            name: 'Tech Baron',
            address: "tech.baron@bashaway2k23.net"
        },
        to: "inventor@bashaway2k23.net",
        text: "Technology knows no bounds.",
        subject: "Hello"
    }, (err)=>{
        if(err) reject(err)
        resolve()
    });
})