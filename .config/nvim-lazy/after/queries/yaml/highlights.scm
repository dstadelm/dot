;; extends
;;

(block_mapping_pair
  key: (flow_node) @reg_node
  (#match? @reg_node "^([.])\@!.*")
  (#set! "priority" 105)
)

(block_mapping_pair
  key: (flow_node) @not_reg_node
  (#match? @not_reg_node "^[.].*")
  (#set! "priority" 105)
)
