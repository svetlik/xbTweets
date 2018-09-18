<template>

  <div id="app">
    <h1 class="title">xbTweets</h1>

    <div class="container">
      <h2>current: {{$mq}}</h2>
      <h2>20 tweets per column</h2>
    </div>

    <div class="container">
      <input type="text" placeholder="Search in tweets...">
    </div>

    <div class="container">
      <div id="xbav-tweets" class="tweet-column" :class="$mq">
        <h3>@xbav_ag</h3>

        <p v-bind:key="tweet" v-for="tweet in tweetsXbav">
          {{ tweet }}
        </p>

      </div>

      <div id="github-tweets" class="tweet-column" :class="$mq">
        <h3>@github</h3>
        <p v-bind:key="tweet" v-for="tweet in tweetsGithub">
          {{ tweet }}
        </p>
      </div>

      <div id="github-tweets" class="tweet-column" :class="$mq">
        <h3>@vuejs</h3>
        <p v-bind:key="tweet" v-for="tweet in tweetsVuejs">
          {{ tweet }}
        </p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["tweetsXbav","tweetsGithub","tweetsVuejs"],
  data: function () {
    return {
    }
  }
}
</script>

<style scoped>
#app {
  color: #123D64;
  background-color: #ecf5fe;
  margin: 20px;
}

.title {
  margin: 0;
  padding-top: 30px;
  text-align: center;
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

input[type=text]:focus {
  width: 50%;
}

.container {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;

}

h3 {
  text-align: center;
}

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



ul {
  list-style: none;
}

.light-blue {
  color: #30B0E9;
}

</style>
