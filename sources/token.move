module my_project::token {
    use sui::object;
    use sui::transfer;

    struct MyToken has key, store {
        id: UID,
        balance: u64,
    }

    public entry fun mint(owner: &signer, amount: u64): MyToken {
        MyToken { id: object::new(), balance: amount }
    }

    public entry fun transfer(sender: &signer, token: MyToken, recipient: address) {
        transfer::public_transfer(token, recipient);
    }
}