var axios = require('axios');
var instance = axios.create({
    timeout: 1000,
    headers: { 'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiQWxmcmVkLUNsaWVudCIsImlhdCI6MTU1MTg1NTg4Nn0.AtrFBLgffBeI9bbIc3orCP1cjglfmCq0iYTOho6NRxI' }
});

let args = process.argv.splice(2);
let newMap = new Object();
let product = `https://mobile.bytedance.net/goapi/products?appType=1`
instance
    .get(product)
    .then(res => {
        res.data.forEach(value => {
            newMap[`${value.id}`] = value.name;
        })
        
        let url = `http://mobile.bytedance.net/mpaas/repo/all?appType=${args[1]}&offset=1&limit=10&search=${args[0]}&appId=-1`
        
        instance
            .get(url)
            .then(res => {
                let items = res.data.data.rows.map(value => {
                    let item = {
                        "uid": value.id,
                        "title": value.repoName,
                        "subtitle": newMap[`${value.appId}`],
                        "arg": `${value.repoName}?appId=${value.appId}&repoId=${value.id}`
                    }
                    return item;
                })
                
                if (res.data.data.rows != 0) {
                    let output = { "items": items };
                    console.log(JSON.stringify(output));
                } else {
                    let output = {
                        "items": [{
                            "uid": "notfound",
                            "title": "没有找到相关组件",
                            "subtitle": "请重新输入"
                        }]
                    }
                    console.log(JSON.stringify(output));
                }

            });
    });


/*
{"items": [
    {
        "uid": "desktop",
        "type": "file",
        "title": "Desktop",
        "subtitle": "~/Desktop",
        "arg": "~/Desktop",
        "autocomplete": "Desktop",
        "icon": {
            "type": "fileicon",
            "path": "~/Desktop"
        }
    }
]}
*/