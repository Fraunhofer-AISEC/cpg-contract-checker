def handle_event(event):
    print(event)
    # and whatever


def log_loop(event_filter, poll_interval):
    while True:
        for event in event_filter.get_new_entries():
            handle_event(event)
        time.sleep(poll_interval)


def main():
    block_filter = w3.eth.filter('latest')
    worker = Thread(target=log_loop, args=(block_filter, 5), daemon=True)
    worker.start()
        # .. do some other stuff

if __name__ == '__main__':
    main()
