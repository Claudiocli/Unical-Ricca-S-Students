package it.urss.payball8.model;

public class HomePage
{

	private float balance;
	//private Account[] listaAmici;
	//private Colletta[] collette;

	public HomePage()	{
		balance=0f;
	}

	public float getBalance()	{return balance;}
	public void updateBalance(float balance)	{this.balance=balance;}

	@Override
	public String toString()
	{
		return "HomePage [balance=" + balance + "]";
	}

}
