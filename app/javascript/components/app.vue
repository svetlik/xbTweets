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
      <TweetColumn :tweets=tweetsXbav title="@xbav_ag"></TweetColumn>
      <TweetColumn :tweets=tweetsGithub title="@github"></TweetColumn>
      <TweetColumn :tweets=tweetsVuejs title="@vuejs"></TweetColumn>
    </div>
  </div>
</template>

<script>
  import draggable from 'vuedraggable'
  import TweetStore from '../store/TweetStore'
  import TweetColumn from "./TweetColumn";

  export default {
    components: {
      draggable,
      TweetColumn
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

</style>
