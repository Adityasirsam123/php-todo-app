<?php
const HOST = '10.0.1.252'; // e.g., '172.31.XX.XX' or 'ec2-XX-XX-XX-XX.compute.amazonaws.com'
const USERNAME = 'aasoka_user';
const PASSWORD = 'Admin@123#';
const DBNAME   = 'erp_12_2_2022';

$dbcon = new mysqli(HOST, USERNAME, PASSWORD, DBNAME);

if ($dbcon->connect_error) {
    die("Connection failed: " . $dbcon->connect_error);
}
