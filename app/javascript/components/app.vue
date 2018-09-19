<template>
  <div id="app">
    <h1 class="title">xbTweets</h1>

    <div class="container">
      <h2>Tweets per column:</h2>
      <h2>50</h2>
      <h2>20</h2>
      <h2>10</h2>
      <h2>5</h2>
      <button @click="increment"></button>
      {{TweetStore.count}}
    </div>

    <div class="container">
      <input type="text" placeholder="Search in tweets...">
    </div>

    <div class="container">
        <div id="xbav-tweets" class="tweet-column" :class="$mq">
          <h3>@xbav_ag</h3>
          <draggable v-model="tweetsXbav" @start="drag=true" @end="drag=false">
            <p v-bind:key="tweet.id" v-for="tweet in tweetsXbav">
              {{ tweet.text }}
            </p>
          </draggable>

        </div>

      <div id="github-tweets" class="tweet-column" :class="$mq">
        <h3>@github</h3>
        <draggable v-model="tweetsGithub" @start="drag=true" @end="drag=false">
          <p v-bind:key="tweet.id" v-for="tweet in tweetsGithub">
            {{ tweet.text }}
          </p>
        </draggable>
      </div>

      <div id="github-tweets" class="tweet-column" :class="$mq">
        <h3>@vuejs</h3>
        <draggable v-model="tweetsVuejs" @start="drag=true" @end="drag=false">
          <p v-bind:key="tweet.id" v-for="tweet in tweetsVuejs">
            {{ tweet.text }}
          </p>
        </draggable>
      </div>
    </div>
  </div>
</template>

<script>
  import draggable from 'vuedraggable'
  import TweetStore from '../store/TweetStore'

  export default {
    components: {
      draggable,
    },
    props: ["tweetsXbav","tweetsGithub","tweetsVuejs","showLess"],
    data: function () {
      return {
        TweetStore: TweetStore.data
      }
    },
    methods: {
      increment () {
        TweetStore.methods.increment()
      }
    },
  }
</script>

<style scoped>

  #app {
    color: #123D64;
    background-color: #ecf5fe;
    margin: 20px;
  }

  input[type=text] {
    width: 200px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
    background-position: 10px 10px;
    background-repeat: no-repeat;
    padding: 12px 20px 12px 20px;
    transition: width 0.4s ease-in-out;
  }

  input[type=text]:focus { width: 50%; }

  h3 { text-align: center; }

  p {
    padding: 0 10px;
    margin: 5px;
    border: solid #30B0E9 2px;
    border-radius: 10px;
  }

  li {
    padding: 10px;
    border: solid white 2px;
  }

  .container {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
  }

  .title {
    margin: 0;
    padding-top: 30px;
    text-align: center;
  }

  .tweet-column {
    display: flex;
    flex-direction: column;
    margin-top: 40px;
    margin-bottom: 40px;
    margin-left: 10px;
    margin-right: 10px;
    width: 30%;
  }

  .mobile { width: 100%; }

  .tablet { width: 60%; }

  .laptop { width: 40%; }

  .desktop { width: 30%; }

  .light-blue {
    color: #30B0E9;
  }

</style>
