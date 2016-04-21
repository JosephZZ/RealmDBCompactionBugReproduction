# RealmDBCompactionBugReproduction

Found out that if the db has been compacted, it can't be accessed by different threads later.
In this reproduction, the second thread would just get stuck at trying to create a Realm instance but never get through.
(However in my original app, two threads get into a deadlock).
