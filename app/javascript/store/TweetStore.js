const TweetStore = {
  data: {
    count: 50,
  },
  methods: {
    setCount(newCount) {
      TweetStore.data.count = newCount
    }
  }
};

export default TweetStore;
