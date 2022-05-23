# Sqitch, domains, constraint, regex…

This project is about **DDL** (Data Definition Language) and **DML** (Data Manipulation Language).

## Sqitch

First of all, after handling the database migrations with numbered `.sql` scripts (branch `before-sqitch`), I switched to **[Sqitch](https://sqitch.org/)**, a **version control framework** for databases.

On the `master`branch, in `migrations` folder, we can find **deploy**, **verify** and **revert** scripts whiwh are played following the `sqitch.plan` file.

## Constraint, Domain

Manipulating DDL using sqitch, I set up **domains** and **constraints** to manage and control precisely what data are allowed.

## Regex

It was also the oportunity to learn how to build my own **regex**.

## Example

In this example, I migrate my database to add two **domains** using precise regex to verify postal code, and number plate validity.

```sql
BEGIN;

CREATE DOMAIN code_postal AS TEXT
CHECK(
-- regex complète: ^(58180|34280|20600|20620)|^(?!00|96|99)(?!20[45789])\d{5}(?<![12]80)$

  -- code postaux très particuliers
  VALUE ~ '^(58180|34280|20600|20620|20300)$'
  OR(
    -- règle générale
    VALUE ~ '^(?!00|96|99)\d{5}$'
    -- exceptions générales
    AND
    VALUE ~ '^\d{5}(?<![12]80)$'
    -- on ajoute la Corse
    AND
    VALUE ~ '^(?!20[3-9])\d{5}$'
    -- on pourrait en rajouter d'autre..
  )
);

ALTER TABLE place
  ALTER COLUMN postal_code TYPE code_postal;

CREATE DOMAIN plate AS TEXT
CHECK(
  -- plaque d'immatriculation moderne et française
  -- lettres à proscrire : I O U et les combinaisons WW et SS
  -- pour les chiffres, la seule combinaison interdite est 000
  VALUE ~ '^inconnu$|^(?!WW|SS)[A-HJ-NP-TV-Z]{2}-(?!000)\d{3}-[A-HJ-NP-TV-Z]{2}(?<!SS)$'
);

ALTER TABLE expedition
  ALTER COLUMN vehicle_plate TYPE plate;

COMMIT;
```

## Sqitch Tips

### Init sqitch with good options

```cmd
sqitch init <project_name> --engine <pg> --target db:<pg>:<ma_bdd> --top-dir <myDir>
```

### Logs

pour save the cmd output :

`sqitch log > mes_logs.txt`

or for a colorfull syntaxe

`sqitch log > mes_logs.log`

or to add to an already existing log file

`sqitch log >> mes_logs.log`
