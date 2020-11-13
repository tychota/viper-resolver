protocol HomeRouterOutput: class { func setWeak(presenter pres: HomePresenterInput) }

class HomeRouter { weak var presenter: HomePresenterInput? }

extension HomeRouter: HomeRouterOutput { func setWeak(presenter pres: HomePresenterInput) { presenter = pres } }
