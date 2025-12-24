MODEL (
  name sqlmesh_a.full_model2,
  kind FULL,
  cron '@daily',
  grain item_id,
  audits (assert_positive_order_ids),
);

SELECT
  item_id,
  COUNT(id) AS orders_total,
FROM
  sqlmesh_a.incremental_model
GROUP BY item_id
  