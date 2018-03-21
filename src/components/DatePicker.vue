<template>
  <el-date-picker
    @change="change"
    v-model="date"
    type="daterange"
    range-separator="To"
    start-placeholder="Start date"
    end-placeholder="End date">
  </el-date-picker>
</template>

<script>
import moment from 'moment'
import event from '../event'

export default {
  data () {
    return {
      date: ''
    }
  },
  methods: {
    change () {
      let from = moment(this.date[0]).valueOf() / 1000
      let to = moment(this.date[1]).valueOf() / 1000
      if (from === to) {
        to += 60 * 60 * 24
      }
      event.$emit('dateChange', from, to)
    }
  }
}
</script>
