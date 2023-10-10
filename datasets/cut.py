import polars as pd

BATCH_COUNT = 50

def main():
    file_name = "out.csv"
    reader = pd.read_csv_batched('d2.csv', n_rows=33908880)
    
    batches = reader.next_batches(BATCH_COUNT)

    header_written = False
    batch_number = 0

    while batches:
        batch = pd.concat(batches)

        if not header_written:
            batch.write_csv(file_name, separator=',', has_header=True)
            header_written = True
        else:
            with open(file_name, "a") as fh:
                fh.write(batch.write_csv(file=None, has_header=False))

        batch_number += BATCH_COUNT
        print(f"batch number: {batch_number}\n")

        batches = reader.next_batches(BATCH_COUNT)


if __name__ == "__main__":
    main()
