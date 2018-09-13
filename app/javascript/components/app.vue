<template>
  <div id="app">
    <div id="xbav-tweets">
      <p>Xbav</p>
      <ol>
        <li v-bind:key="tweet" v-for="tweet in tweets_xbav">
          {{ tweet }}
        </li>
      </ol>
    </div>

    <div id="github-tweets">
      <p>Github</p>
      <ol>
        <li v-bind:key="tweet" v-for="tweet in tweets_github">
          {{ tweet }}
        </li>
      </ol>
    </div>

    <div id="github-tweets">
      <p>VueJS</p>
      <ol>
        <li v-bind:key="tweet" v-for="tweet in tweets_vuejs">
          {{ tweet }}
        </li>
      </ol>
    </div>
  </div>
</template>

<script>
export default {
  props: ["tweets_xbav","tweets_github","tweets_vuejs"],
  data: function () {
    return {
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
