<template>
    <v-container>
        <v-layout row wrap>
            <v-flex xs12 v-for="d in data" >
                <v-card class="mb-2">

                    <v-card-title class="card_title">
                        <div class="top_box">
                            <div class="top_box_left">
                                <v-avatar
                                  :tile="false"
                                  color="grey lighten-4"
                                  class="avatar"
                                >
                                <img src="https://vuetifyjs.com/apple-touch-icon-180x180.png" alt="avatar">
                                </v-avatar>
                                <div class="top_box_left_info">
                                    <div class="top_box_left_info_flex">
                                        <v-chip class="chip"><i>SpitBaller</i></v-chip>
                                        <span>{{getDate(d.dateTime)}}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="top_box_bottom">
                                <span class="pts" v-if="d.price">{{d.price.toFixed(2)}} Pts</span>
                                <v-icon medium>more_vert</v-icon>
                            </div>
                        </div>
                    </v-card-title>

                    <v-card-text>
                        <div class="center_box">
                            <div class="center_box_left">
                                <v-icon class="arrow_up" medium>expand_less</v-icon>
                                <p>{{d.vote.votes}}</p>
                                <v-icon class="arrow_down" :style="d.vote.votes ? 'opacity:1' : 'opacity:.4' " medium>expand_more</v-icon>
                            </div>
                            <div class="center_box_middle">
                                <div class="center_box_middle_top">
                                    <p class="title">{{d.title}}</p>
                                    <v-icon class="copy">file_copy</v-icon>
                                </div>
                                <p v-if="d.snippet" class="snippet">{{d.snippet.slice(0,94)}}...</p>
                            </div>
                        </div>
                        <p class="university" v-if="/^[A-Za-z]*$/.test(d.course)">{{`${d.university} * ${d.course}`}}</p>
                        <p class="university" v-else>{{`${d.course} * ${d.university}`}}</p>
                    </v-card-text>

                    <v-card-actions class="pr-4">
                      <v-spacer></v-spacer>
                      <p class="document" v-if="d.type">Doucment</p>
                      <v-btn icon>
                        <v-icon color="grey lighten-1">cloud_download</v-icon>
                        <span class="badges">{{d.downloads}}</span>
                      </v-btn>
                      <v-btn icon>
                        <v-icon color="grey lighten-1">visibility</v-icon>
                        <span class="badges">{{d.views}}</span>
                      </v-btn>
                    </v-card-actions>

                </v-card>
            </v-flex>
        </v-layout>
    </v-container>
</template>

<script>
  export default {
    props: ['data'],
    data: () => ({

    }),
    methods: {
      getDate(date) {
        let d = new Date(date),
            year = d.getFullYear(),
            day = d.getDate(),
            month = d.toLocaleString('en-us', { month: 'long' })

        return `${month} ${day}, ${year}`
      }
    }
  }
</script>

<style scoped>
.top_box {
  display: flex;
  width: 100%;
  justify-content: space-between;
}
.top_box_left_info { display: inline-block; margin-left: 10px; }
.top_box_left_info_flex > span:nth-child(2) { color: #aaa; }
.top_box_bottom { align-self: center; }
.top_box_bottom > i, .copy, .arrow_up, .arrow_down { cursor: pointer; }
.copy { cursor: pointer; }
.chip { background-color: #555; color: #fff; }
.center_box { display: flex; }
.center_box_left { margin-right: 10px }
.center_box_middle_top > p { margin: 0; }
.center_box_left > p { margin: 0; text-align: center; }
.center_box_middle {
  align-self: center;
  max-height: max-content;
  background-color: #eee;
  padding: 10px;
  flex: 1;
}
.snippet { margin-top: 14px; }
.center_box_middle_top { display: flex;justify-content: space-between; }
.university { margin: 10px 0 0 39px; }
.document { margin-right: 30px; color: #3F51B5; font-weight: 600; font-size: 16px; }
.badges { font-size: 12px; margin-left: 6px }

@media screen and (max-width: 425px) and (min-width: 320px) {

  .card_title { padding: 10px; }
  .top_box_left_info_flex {
    display: flex;
    flex-direction: column-reverse;
  }
  .top_box_left_info_flex > span { align-self: center; }
  .avatar { vertical-align: text-bottom; }
  .top_box_left_info_flex > span:nth-child(2) { padding-bottom: 10px }
  .pts { font-size: 16px; }
  .center_box_middle_top > i { align-self: flex-start; }
}

@media screen and (min-width: 425px) {

  .top_box_left_info_flex > span:nth-child(2) { margin-left: 10px; font-family: serif; }
  .pts { font-size: 24px; margin-right: 14px; }

}

</style>
