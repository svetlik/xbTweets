<template>
  <div class="tweet-column" :class="$mq">
    <h3>{{title}}</h3>
    <draggable v-model=tweets @start="drag=true" @end="drag=false">
      <p v-bind:key="tweet.id" v-for="tweet in tweets">
        {{ tweet.text }}
      </p>
    </draggable>

  </div>
</template>

<script>
import draggable from 'vuedraggable'

export default {
  name: 'TweetColumn',
  components: {
    draggable
  },
  props: ["title", "tweets"],
  data: function() {
    return {
    }
  },
}
</script>

<style scoped>
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
