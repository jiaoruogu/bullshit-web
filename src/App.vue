<template>
  <div id="app">
    <!-- 提交未触发构建 -->
    <div style="height:100%" v-if="isLogin">
      <div class="input-content">
        <h1>当初的愿望实现了吗 ? ? ? ? ? ?</h1>
        <h2>触发测试呀</h2>
        <h3>zhengo</h3>
        <h4>cao nbima a fa f </h4>














        <h5>这什么狗几把jenkins</h5>

        <div>
          <input v-model="content" type="text">
          <button @click="confirm">确定</button>
        </div>
      </div>
      <ul ref="content">
        <li v-for="item in bullshitList" :key="item.id">{{item.content}}</li>
      </ul>
    </div>
    <div class="login"  v-else>
      <input v-model="loginParam.username" type="text">
      <input v-model="loginParam.password" type="text">
      <button @click="login">登录</button>
    </div>
  </div>
</template>

<script>
import {search, add, login} from './request'

export default {
  name: 'App',
  data () {
    return {
      loginParam: {
        username: 'admin',
        password: '123',
      },
      content: '',
      bullshitList: [],
      isLogin: false,
    }
  },
  methods: {
    confirm () {
      if(!this.content) return
      add({content: this.content}).then(res => {
        if(res.data?.code === -1) {
          this.isLogin = false
          return
        }
        this.content = ''
        this.search()
      })
    },
    login () {
      login(this.loginParam).then(res => {
        if(res.data?.code === -1) {
          alert('登录失败')
          return
        }
        this.isLogin = true
        this.search()
      })
    },
    search () {
      search().then(res => {
        if(res.data?.code === -1) {
          this.isLogin = false
          return
        }
        this.bullshitList = res.data.sort((a, b) => {
          const x = a.createtime, y = b.createtime
          return y - x
        })
      })
    },
    scrollContent() {
      this.$refs.content.scrollTop(0)
    },
  }
}
</script>

<style>
html,body {
  margin: 0;
  height: 0;
  height: 100%;
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;

  /* margin-top: 60px; */
  /* height: 100vh; */
  height: 100%;
}
h1 {
  margin: 0;
  padding: 30px;
}
ul > li {
  list-style: none;
  font-size: 20px;
  margin: 10px;
}
input{
    outline-style: none ;
    border: 1px solid #ccc;
    border-radius: 3px;
    padding: 13px 14px;
    width: 620px;
    font-size: 14px;
    font-weight: 700;
    font-family: "Microsoft soft";
}
button {
    outline-style: none ;
    border: 1px solid #ccc;
    border-radius: 3px;
    padding: 13px 14px;
    width: 60px;
    font-size: 14px;
    font-weight: 700;
    font-family: "Microsoft soft";
}
input:focus{
    border-color: #66afe9;
    outline: 0;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
}
.login {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding-top: 20px;
}
.login input {
  margin-top: 10px;
  margin-bottom: 10px;

}
.login button {
  width: 120px;
}
.input-content {
  height: 150px;

}
</style>
