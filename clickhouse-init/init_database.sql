CREATE TABLE IF NOT EXISTS s3_table ON CLUSTER 'company_cluster' (id String)
ENGINE = ReplicatedMergeTree('/clickhouse/{cluster}/tables/s3_table_zoo', '{replica}')
ORDER BY id SETTINGS storage_policy = 's3_policy';
CREATE TABLE IF NOT EXISTS s3_table_distributed ON CLUSTER 'company_cluster' (id String)
ENGINE = Distributed('{cluster}', 'default', 's3_table', rand());
