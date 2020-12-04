const fs = require('fs');

// keep track of lifetime statistics and store locally
export default class Stats {

    constructor() {
        this.stats_map = Stats.read_stats();
    }

    // read in statistics from local file
    static read_stats() {
        let stats_map = new Map();
        let stats = fs.readFileSync("src/stats.txt", "utf-8");
        let stats_split = stats.split("\n");
        stats_split.forEach(stat => {
            let key;
            let value;
            [key, value] = stat.split(': ');
            value = parseFloat(value);
            if (!isNaN(value)) {
                stats_map.set(key, value);
            }
        })
        return stats_map;
    }

    // increment games tracker
    static count_num_games(stats_map) {
        stats_map.set('num_games', stats_map.get('num_games') + 1);
    }

    // increment deals tracker
    static count_num_deals(stats_map) {
        stats_map.set('num_deals', stats_map.get('num_deals') + 1);
    }

    // decrement deals tracker
    static decrement_number_deals(stats_map) {
        stats_map.set('num_deals', stats_map.get('num_deals') - 1);
    }

    // increment reshuffles tracker
    static count_num_reshuffles(stats_map) {
        stats_map.set('num_reshuffles', stats_map.get('num_reshuffles') + 1);
    }

    // calculate chance of user not finding set
    static chance_of_no_set(stats_map) {
        stats_map.set('chance_of_no_set', stats_map.get('num_reshuffles') / (stats_map.get('num_reshuffles') + stats_map.get('num_deals')));
    }

    // increment correct answer tracker
    static count_correct_answers(stats_map) {
        stats_map.set('num_correct_answers', stats_map.get('num_correct_answers') + 1);
    }

    // increment incorrect answer tracker
    static count_incorrect_answers(stats_map) {
        stats_map.set('num_incorrect_answers', stats_map.get('num_incorrect_answers') + 1);
    }

    // calculate lifetime accuracy (player and cpu combined)
    static avg_accuracy(stats_map) {
        stats_map.set('avg_accuracy', stats_map.get('num_correct_answers') / (stats_map.get('num_correct_answers') + stats_map.get('num_incorrect_answers')));
    }

    // write updated statistics to stats.txt
    static write_stats(stats_map) {
        fs.unlink('src/stats.txt', function (err) {
            if (err) throw err;
        });
        stats_map.forEach( (value, key) => fs.appendFile('src/stats.txt', key.toString() + ': ' + value.toString() + "\n", function (err) {
            if (err) throw err;
        }));
    }
}
