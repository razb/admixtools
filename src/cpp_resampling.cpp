// [[Rcpp::plugins(cpp11)]]
// [[Rcpp::depends(RcppArmadillo)]]
#include <RcppArmadillo.h>
using namespace Rcpp;
using namespace arma;


// [[Rcpp::export]]
IntegerVector cpp_get_block_lengths(IntegerVector chr, DoubleVector pos, double blgsize = 0.05) {

  double fpos = -1e20;
  int chrom;
  int lchrom = -1;
  int xsize = 0;
  int n = 0;
  int nsnps = chr.length();
  double gpos, dis;
  IntegerVector bsize(nsnps);

  for(int i = 0; i < nsnps; i++) {
    chrom = chr(i);
    gpos = pos(i);
    dis = gpos - fpos;
    if((chrom != lchrom) || (dis >= blgsize)) {
      if(xsize > 0) {
        bsize(n) = xsize;
        n++;
      }
      lchrom = chrom;
      fpos = gpos;
      xsize = 0;
    }
    xsize++;
  }
  if (xsize > 0) {
    bsize(n) = xsize;
    n++;
  }
  return bsize[Rcpp::Range(0, n-1)];
}

List cpp_jack_vec_stats2(NumericVector loo_vec, NumericVector block_lengths) {

  double n = sum(block_lengths);
  NumericVector h = n/block_lengths;
  double est = sum(loo_vec * (1-1/h))/sum(1-1/h);
  double var = mean(pow(est - loo_vec, 2)*(h-1));

  return Rcpp::List::create(_["est"] = est, _["var"] = var);
}


// [[Rcpp::export]]
List cpp_jack_vec_stats(NumericVector loo_vec, NumericVector block_lengths, double tot = NA_REAL) {
  // input is a vector of leave-one-out estimates
  // output is list with jackknife mean and covariance
  // should give same results as 'jack_arr_stats' and 'jack_mat_stats'

  block_lengths = block_lengths[!is_na(loo_vec)];
  loo_vec = loo_vec[!is_na(loo_vec)];
  if(!is_finite(tot)) return(cpp_jack_vec_stats2(loo_vec, block_lengths));
  double n = sum(block_lengths);
  NumericVector w = 1-block_lengths/n;
  //if(!is_finite(tot)) tot = sum(loo_vec*w)/sum(w); // only valid when estimates are additive
  double est = sum(tot - loo_vec) + sum(loo_vec*block_lengths)/n;
  NumericVector h = n/block_lengths;
  NumericVector tau = h*tot - (h-1)*loo_vec;
  double var = mean(pow(tau - est, 2)/(h-1));

  //return List::create(est, var);
  return Rcpp::List::create(_["est"] = est, _["var"] = var);
}












