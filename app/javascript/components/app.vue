<template>
  <div id="app">
    <h1 class="title">xbTweets</h1>

    <div class="buttons">
      <button @click="setCount(50)">50</button>
      <button @click="setCount(20)">20</button>
      <button @click="setCount(10)">10</button>
      <button @click="setCount(5)">5</button>
    </div>

    <div class="container">
      <input type="text" v-model="search" placeholder="Search in tweets..."/>
    </div>

    <div class="container">
      <!-- <TweetColumn :tweets=tweetsXbav title="@xbav_ag"></TweetColumn> -->
      <!-- <TweetColumn :tweets=tweetsGithub title="@github"></TweetColumn> -->
      <!-- <TweetColumn :tweets=tweetsVuejs title="@vuejs"></TweetColumn> -->
      <div class="tweet-column" :class="$mq">
        <h3>@xbav_ag</h3>

        <draggable v-model=tweetsXbav @start="drag=true" @end="drag=false">
          <p v-bind:key="tweet.id" v-for="tweet in filtered_tweetsXbav.slice(0, TweetStore.count)">
            {{ tweet.text }}
          </p>
        </draggable>

      </div>

      <div class="tweet-column" :class="$mq">
        <h3>@github</h3>
        <draggable v-model=tweetsGithub @start="drag=true" @end="drag=false">
          <p v-bind:key="tweet.id" v-for="tweet in filtered_tweetsGithub.slice(0, TweetStore.count)">
            {{ tweet.text }}
          </p>
        </draggable>

      </div>

      <div class="tweet-column" :class="$mq">
        <h3>@vuejs</h3>
        <draggable v-model=tweetsVuejs @start="drag=true" @end="drag=false">
          <p v-bind:key="tweet.id" v-for="tweet in filtered_tweetsVuejs.slice(0, TweetStore.count)">
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
        search: '',
        TweetStore: TweetStore.data
      }
    },
    methods: {
      setCount(newCount) {
        TweetStore.methods.setCount(newCount)
      }
    },
    computed: {
      filtered_tweetsXbav:function() {
        var self=this;

        return this.tweetsXbav.filter(function(tweet) {
          console.log(tweet.text);
          return tweet.text.toLowerCase().indexOf(self.search.toLowerCase())>=0;
        });
      },
      filtered_tweetsGithub:function() {
        var self=this;

        return this.tweetsGithub.filter(function(tweet) {
          console.log(tweet.text);
          return tweet.text.toLowerCase().indexOf(self.search.toLowerCase())>=0;
        });
      },
      filtered_tweetsVuejs:function() {
        var self=this;

        return this.tweetsVuejs.filter(function(tweet) {
          console.log(tweet.text);
          return tweet.text.toLowerCase().indexOf(self.search.toLowerCase())>=0;
        });
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
    border-radius: 4px;
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

  button {
    margin-top: 20px;
    border: none;
    background-color: #30B0E9;
    color: white;
    padding: 15px;
    font-size: 15px;
    border-radius: 4px;
  }

  button:hover{background-color: #123D64;}

  .buttons {
    display: flex;
    justify-content: center;
    margin: 30px 0 30px 0;
  }

</style>
