-- Deploy ocolis:constraints_2 to pg

BEGIN;

CREATE DOMAIN numberplate AS text CHECK (VALUE ~ '(^[a-zA-Z]{2}-\d{3}-[a-zA-Z]{2}$)|(^\d{2,3}[a-zA-Z]-([2-9]\d{3}|1[1-9]\d{2}|10[1-9]\d|100[1-9])[a-zA-Z]$)|(^([2-4]|[6-9])\d{3}(000[1-9]|00[1-9]\d|0[1-9]\d{2})$)');

CREATE DOMAIN postalcode AS text CHECK (VALUE ~ '(^(0[1-9]|1\d|2[1-9]|[3-8]\d|9([0-5]|[7-9]))\d{3}$)|(^2[AB]\d{3}$)|(^97([1-4]|6)\d{3}$)');

COMMIT;
