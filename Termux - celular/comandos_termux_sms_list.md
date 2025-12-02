# TERMUX-SMS-LIST 

Man-page:

Command lists SMS conversations and messages.

Usage:
    `termux-sms-list [command_options]`

Available command_options:
```
[ -h | --help ]           Display this help screen.
#    [ --version ]             Display version.
[ -q | --quiet ]          Set log level to 'OFF'.
[ -v | -vv | -vvv | -vvvvv ]
      Set log level to 'DEBUG', 'VERBOSE',
      'VVERBOSE' and 'VVVERBOSE'.
[ -c | --conversation-list ]
      Show SMS conversations list instead of
      messages list.
      By default only one SMS message per
      conversation is returned unless the
      '--conversation-return-multiple-messages'
      option is passed.
      By default all SMS messages are returned
      as a single array without nesting
      unless the
      '--conversation-return-nested-view'
      option is passed.
[ --conversation-limit=<limit> ]
      The SQL limit for returned SMS
      conversations.
[ --conversation-offset=<offset> ]
      The SQL offset for returned SMS
      conversations.
[ --conversation-return-multiple-messages ]
      Return multiple SMS messages per
      conversation.
[ --conversation-return-nested-view ]
      Return a nested object view of
      conversations where each conversation
      contains an array of SMS messages with
      the conversation id as the key.
[ --conversation-return-no-order-reverse ]
      Return SMS conversations without
      reversing order of conversation sort.
[ --conversation-selection=<selection> ]
      The SQL selection for returned SMS
      conversations.
[ --conversation-sort-order=<order> ]
      The SMS conversations sort order as per
      SQL 'ORDER BY col1, col2, ... ASC|DESC'
      clause.
      Default value: 'date DESC'.
[ -f address | --message-address=<address> ]
      The address or phone number of the
      sender to return SMS messages for.
      The '--conversation-selection' option
      will override this if passed.
[ -l limit | --message-limit=<limit> ]
      The limit for returned SMS messages.
      Default value: '10'.
[ -o offset | --message-offset=<offset> ]
      The offset for returned SMS messages.
      Default value: '0'.
[ --message-return-no-order-reverse ]
      Return SMS messages without reversing
      order of message sort.
[ --message-selection=<selection> ]
      The SQL selection for returned SMS
      messages.
[ --message-sort-order=<order> ]
      The SMS messages sort order as per
      SQL 'ORDER BY col1, col2, ... ASC|DESC'
      clause.
      Default value: 'date DESC'.
[ -t type | --message-type=<type> ]
      The type of returned SMS messages.
      Default value: 'all'.
      Supported values: 'all|inbox|sent|draft|outbox|failed|queued'.
```


# Sort and Print Order

When conversation or messages are queried from the Android database,
first the sort order is applied, and then any offset and limit values
are used to filter the entries. Since the default sort order is
'date DESC', Android returns the latest dated conversations or
messages first, but the API reverses the order by default so that
the latest entries are printed at the end. If the order should not be
reversed, then pass the respective `--*-return-no-order-reverse`
options.



# Message Type

The following numbers can be used to match a message 'type' with
the '--message-selection' option.
- all: 0
- inbox: 1
- sent: 2
- draft: 3
- outbox: 4
- failed: 5
- queued: 6



### Examples

```
# Get lastest 10 messages with latest dated message printed at end.
termux-sms-list

# Get lastest 10 messages with latest dated message printed at start.
termux-sms-list --message-return-no-order-reverse

# Get latest message of any type.
termux-sms-list --message-limit=1

# Get latest inbox message.
termux-sms-list --message-selection="type == 1" \
    --message-limit=1

# Get latest sent message.
termux-sms-list --message-selection="type == 2" \
    --message-limit=1

# Get oldest 10 messages with latest dated message printed at end.
termux-sms-list --message-sort-order="date ASC" \
    --message-return-no-order-reverse

# Get the latest inbox message received from the address '991230000' that
# starts with the text 'Foo '.
termux-sms-list \
    --message-selection="type == 1 and address == '991230000' and body LIKE 'Foo %'" \
    --message-limit=1

# Get the latest sent message sent to the address '991230000' that
# starts with the text 'Bar '.
termux-sms-list \
    --message-selection="type == 2 and address == '991230000' and body LIKE 'Bar %'" \
    --message-limit=1


# Get list view for conversations with default conversation limit and
# 1 message per conversastion.
termux-sms-list --conversation-list

# Get list view for conversations with default conversation limit and
# 10 messages per conversation.
termux-sms-list --conversation-list \
    --conversation-return-multiple-messages


# Get nested view for conversations with default conversation and
# message limits.
termux-sms-list --conversation-list \
    --conversation-return-multiple-messages \
    --conversation-return-nested-view

# Get nested view for latest conversation with latest 5 messages.
termux-sms-list --conversation-list \
    --conversation-return-multiple-messages \
    --conversation-return-nested-view \
    --conversation-limit=1 \
    --message-limit=5

# Get nested view for conversations sorted on thread id with highest
# conversation id printed at end.
termux-sms-list --conversation-list \
    --conversation-return-multiple-messages \
    --conversation-return-nested-view \
    --conversation-sort-order="thread_id ASC" \
    --conversation-return-no-order-reverse

# Get nested view for conversations for conversation with address
# equal to '991230000'.
termux-sms-list --conversation-list \
    --conversation-return-multiple-messages \
    --conversation-return-nested-view \
    --conversation-selection="address == '991230000'"

# Get nested view for conversations for conversation with thread id
# equal to '6'.
termux-sms-list --conversation-list \
    --conversation-return-multiple-messages \
    --conversation-return-nested-view \
    --conversation-selection="thread_id == 6"
```


 **See Also:**
 - https://developer.android.com/reference/android/provider/Telephony
 - https://developer.android.com/reference/android/provider/Telephony.Sms.Conversations
 - https://developer.android.com/reference/android/provider/Telephony.TextBasedSmsColumns
 - https://developer.android.com/reference/android/provider/BaseColumns
