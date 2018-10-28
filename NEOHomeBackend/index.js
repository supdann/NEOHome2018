var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var port = process.env.PORT || 8888;
var router = express.Router()
const JSum = require('jsum')

let { default: Neon, api, nep5, rpc, sc, wallet } = require('@cityofzion/neon-js')

getByteArrayAddress = (address) => {
    if (address.length !== 34) {
        alert(`Address ${address} needs to be 34 length. Instead it's ${address.length}.`)
    } else {
        return sc.ContractParam.byteArray(address, 'address');
    }
}

function hex_to_ascii(str1) {
    var hex = str1.toString();
    var str = '';
    for (var n = 0; n < hex.length; n += 2) {
        str += String.fromCharCode(parseInt(hex.substr(n, 2), 16));
    }
    return str;
}

async function getRequest() {

    console.log("Something happened");

    return new Promise((resolve, reject) => {

        let scriptHash = '0c9b501f156839994d5c788aea55fb07192958c6'
        let operation = "tokensDataOfOwner" // owner
        let myAddress = 'AK2nJJpJr6o664CWJKi1QRXjqeic2zRp8y'
        let args = [getByteArrayAddress(myAddress), 1]

        let script = Neon.create.script(
            {
                scriptHash: scriptHash,
                operation: operation,
                args: args
            }
        );

        rpc.Query.invokeScript(script).execute('http://46.101.237.125:30333')
            .then(res => {
                // console.log("res: " + JSON.stringify(res))
                // console.log("Stack: " + JSON.stringify(res.result.stack))

                if (res.result.stack) {
                    let value = res.result.stack[0]["value"]

                    const regex = /\\u.{1,4}/gm;
                    const subst = ``;

                    // The substituted value will be contained in the result variable
                    const result = value.replace(regex, subst);

                    resolve(hex_to_ascii(result))
                } else {
                    reject("there is no stack!")
                }

            }).catch(err => {
                reject(err)
            })
    })
}

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

router.get('/', function (req, res) {
    console.log("Something happened");
    getRequest().then((resp) => {
        res.json({ message: resp })
    }).catch((err) => {
        res.json({ error: err })
    })
});

app.use('/api', router);
app.listen(port);
console.log('Running on port ' + port);
