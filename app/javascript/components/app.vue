<template>
  <div id="app">
    <!-- <p>{{ message }}</p> -->
    <!-- <p v-bind:title="message">
      Hover your mouse over me for a few seconds
      to see my dynamically bound title!
    </p> -->
    <!-- <div id="app-3">
      <span v-if="seen">Now you see me</span>
    </div> -->
    <div id="app-4">
      <ol>
        <li v-bind:key="todo" v-for="todo in todos">
          {{ todo.text }}
        </li>
      </ol>
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      // message: 'You loaded this page on ' + new Date().toLocaleString(),
      // seen: true,
      todos: [
        { text: 'Learn JavaScript' },
        { text: 'Learn Vue' },
        { text: 'Build something awesome' }
      ]
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
