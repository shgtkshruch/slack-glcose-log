<template>
  <div class="hello">
    <ul>
      <li v-for="meal in meals" :key=meal.timestamp v-show="isShow(meal)">
        <el-card class="card">
          <div slot="header" class="clearfix">
            <time class="time">{{ dateTime(meal.timestamp) }}</time>
            <p class="title">{{ meal.title }}</p>
          </div>
          <img :src= meal.image />
        </el-card>
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
      from: '1520467200',
      to: '1521676800'
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
}

li {
  display: inline-block;
  margin: 2rem 0;
}

img {
  max-width: 100%;
}

.title {
  margin: 0.8rem 0 0;
  font-weight: bold;
  font-size: 1.3rem;
}

.time {
  font-size: 0.9rem;
  letter-spacing: 0.05em;
  color: #6b6b6b;
}
</style>
