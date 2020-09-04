public class Complex { //<>//
  float mR;
  float mI;

  public Complex() {
    mR = 0;
    mI = 0;
  }

  public Complex(float _r, float _i) {
    mR = _r;
    mI = _i;
  }

  public float getR() {
    return mR;
  }

  public float getI() {
    return mI;
  }

  public void setR(float _r) {
    mR = _r;
  }

  public void setI(float _i) {
    mI = _i;
  }

  public Complex Addition(Complex number1, Complex number2) {
    Complex resultat = new Complex();

    // adition
    resultat.setR(number1.getR() + number2.getR());
    resultat.setI(number1.getI() + number2.getI());

    return resultat;
  }

  public Complex Multyply(Complex number1, Complex number2) {
    Complex resultat = new Complex();

    resultat.setR(number1.getR() * number2.getR() - (number1.getI() * number2.getI()));
    resultat.setI((number1.getR() * number2.getI()) + (number1.getI() * number2.getR()));
    return resultat;
  }

  public Complex Squar(Complex number) {
    Complex resultat = new Complex();

    resultat.setR(number.getR() * number.getR() - (number.getI() * number.getI()));
    resultat.setI((number.getR() * number.getI()) + (number.getI() * number.getR()));
    return resultat;
  }






//////////////////////////////////////
/////////////////////////////////////
  public Complex Addition(Complex number) {
    Complex resultat = new Complex();

    // adition
    resultat.setR(getR() + number.getR());
    resultat.setI(getI() + number.getI());

    return resultat;
  }

  public Complex Multyply(Complex number) {
    Complex resultat = new Complex();

    resultat.setR(getR() * number.getR() - (getI() * number.getI()));
    resultat.setI((getR() * number.getI()) + (getI() * number.getR()));
    return resultat;
  }

  public Complex Squar() {
    Complex resultat = new Complex();

    resultat.setR(getR() * getR() - (getI() * getI()));
    resultat.setI((getR() * getI()) + (getI() * getR()));
    return resultat;
  }
}
