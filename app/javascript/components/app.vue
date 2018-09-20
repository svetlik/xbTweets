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
      <!-- <TweetColumn :tweets=tweetsXbav title="@xbav_ag"></TweetColumn> -->
      <!-- <TweetColumn :tweets=tweetsGithub title="@github"></TweetColumn> -->
      <!-- <TweetColumn :tweets=tweetsVuejs title="@vuejs"></TweetColumn> -->
      <div class="tweet-column" :class="$mq">
        <h3>@xbav_ag</h3>
        <draggable v-model=tweetsXbav @start="drag=true" @end="drag=false">
          <p v-bind:key="tweet.id" v-for="tweet in tweetsXbav">
            {{ tweet.text }}
          </p>
        </draggable>

      </div>

      <div class="tweet-column" :class="$mq">
        <h3>@github</h3>
        <draggable v-model=tweetsGithub @start="drag=true" @end="drag=false">
          <p v-bind:key="tweet.id" v-for="tweet in tweetsGithub">
            {{ tweet.text }}
          </p>
        </draggable>

      </div>

      <div class="tweet-column" :class="$mq">
        <h3>@vuejs</h3>
        <draggable v-model=tweetsVuejs @start="drag=true" @end="drag=false">
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
  import TweetColumn from "./TweetColumn";

  export default {
    components: {
      draggable,
      TweetColumn
    },
    props: ["tweetsXbav","tweetsGithub","tweetsVuejs"],
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
    mounted() {
      console.log('App mounted!');
      console.log(localStorage)
      if (localStorage.getItem('tweetsXbav')) this.tweetsXbav = JSON.parse(localStorage.getItem('tweetsXbav'));
      if (localStorage.getItem('tweetsGithub')) this.tweetsGithub = JSON.parse(localStorage.getItem('tweetsGithub'));
      if (localStorage.getItem('tweetsVuejs')) this.tweetsVuejs = JSON.parse(localStorage.getItem('tweetsVuejs'));
    },
    watch: {
      tweetsXbav: {
        handler() {
          console.log('TweetsXbav changed!');
          localStorage.setItem('tweetsXbav', JSON.stringify(this.tweetsXbav));
        },

        deep: true,
      },
      tweetsGithub: {
        handler() {
          console.log('TweetsGithub changed!');
          localStorage.setItem('tweetsGithub', JSON.stringify(this.tweetsGithub));
        },

        deep: true,
      },
      tweetsVuejs: {
        handler() {
          console.log('TweetsVuejs changed!');
          localStorage.setItem('tweetsVuejs', JSON.stringify(this.tweetsVuejs));
        },

        deep: true,
      },
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

  h3 { text-align: center; }

  p {
    padding: 0 10px;
    margin: 5px;
    border: solid #30B0E9 2px;
    border-radius: 10px;
  }

  .tweet-column {
    display: flex;
    flex-direction: column;
    margin-top: 40px;
    margin-bottom: 40px;
    margin-left: 10px;
    margin-right: 10px;
  }

  .mobile { width: 90%; }

  .tablet { width: 60%; }

  .laptop { width: 40%; }

  .desktop { width: 30%; }


</style>
