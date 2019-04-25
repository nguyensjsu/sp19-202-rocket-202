interface IAddAccountSubject {

    void attachAddAccountObserver(IAddAccountObserver observer);

    void removeAddAccountObserver(IAddAccountObserver observer);

    void notifyAddAccountObservers(Account account);

}
