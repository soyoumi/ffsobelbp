const express = require('express');
const app = express();
const http = require('http').Server(app);
const io = require('socket.io')(http);
//app.use(express.static(__dirname+'/ws'));  //设置网站目录，这里服务器后台，可能暂时不需要

http.listen(3200, ()=>{
    console.log('服务器端口：3200');
});

io.on( 'connection', socket =>{
    console.log('连接成功！');
    socket.on('Fmessage',()=>{
        console.log('收到消息！');
        socket.emit('Kmessage', '收到消息了！');
    });
});

//ws服务断开
io.on( 'disconnect', socket =>{
    console.log('连接状态:', socket.connected); //false
    console.log('服务器已断开连接！');
});