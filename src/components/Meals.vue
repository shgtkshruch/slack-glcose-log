<template>
  <div class="hello">
    <ul>
      <li v-for="meal in meals" :key=meal.timestamp v-show="isShow(meal)">
        <p>{{ dateTime(meal.timestamp) }}</p>
        <p>{{ meal.title }}</p>
        <img :src= meal.image />
      </li>
    </ul>
  </div>
</template>

<script>
import meals from '../assets/meal.json'
import moment from 'moment'
import event from '../event'

export default {
  data () {
    return {
      meals,
      from: '',
      to: ''
    }
  },
  created () {
    event.$on('dateChange', (from, to) => {
      this.from = from
      this.to = to
    })
  },
  methods: {
    dateTime (unixTime) {
      return moment.unix(unixTime).format('YYYY/MM/DD HH:mm')
    },
    isShow (meal) {
      return meal.timestamp > this.from && meal.timestamp < this.to
    }
  }
}
</script>

<style scoped>
ul {
  list-style-type: none;
  padding: 0;
  font-family: 'Helvetica Neue', YuGothic;
  letter-spacing: 0.05em;
}

li {
  display: inline-block;
  margin: 0 10px;
}

img {
  max-width: 100%;
}
</style>
