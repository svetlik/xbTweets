const TweetStore = {
  data: {
    count: 2,
  },
  methods: {
    increment() {
      TweetStore.data.count++
    }
  }
};

export default TweetStore;
