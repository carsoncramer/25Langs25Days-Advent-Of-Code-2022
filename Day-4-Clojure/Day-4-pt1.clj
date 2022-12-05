;;Link to problem: https://adventofcode.com/2022/day/4
(ns hello)

(def counter (atom 0)) ;;declaring the counter
(defn inc-counter [] ;;func to increment the counter
  (swap! counter inc))

(let [file-contents   (slurp "input.txt") ;;read in the whole input file and store in memory                                                                                                                   
      nums-as-strings (clojure.string/split file-contents #"(-|\n|,)") ;;split on dashes, newlines, or commas                                                                                                            
      numbers         (map read-string nums-as-strings)] ;;convert to nums
    
    (loop [x 0] ;;loop start x at 0
        (when (< x (count numbers)) ;;while x is less than the size of numbers
            (let [x1 (nth numbers x) y1 (nth numbers (+ x 1)) x2 (nth numbers (+ x 2)) y2 (nth numbers (+ x 3))] ;;set variables
            (when (or (and (<= x1 x2)(>= y1 y2))(and (>= x1 x2)(<= y1 y2))) ;;if one range is within another
                (inc-counter))) ;;increment counter
            (recur (+ x 4)))) ;;call recursively, add 4 to move to a new set of ranges.
)

(println @counter)




