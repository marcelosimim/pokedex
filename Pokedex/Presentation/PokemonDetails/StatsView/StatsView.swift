//
//  StatsView.swift
//  Pokedex
//
//  Created by Marcelo Simim Santos on 8/3/22.
//

import UIKit

class StatsView: UIView {

    private let baseLineSeparator = UIView()
    private let hpLabel = UILabel()
    private let hpValue = UILabel()
    private let hpBar:UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.layer.cornerRadius = 4
        progress.clipsToBounds = true
        return progress
    }()
    private let atkLabel = UILabel()
    private let atkValue = UILabel()
    private let atkBar:UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.layer.cornerRadius = 4
        progress.clipsToBounds = true
        return progress
    }()
    private let defLabel = UILabel()
    private let defValue = UILabel()
    private let defBar:UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.layer.cornerRadius = 4
        progress.clipsToBounds = true
        return progress
    }()
    private let satkLabel = UILabel()
    private let satkValue = UILabel()
    private let satkBar:UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.layer.cornerRadius = 4
        progress.clipsToBounds = true
        return progress
    }()
    private let sdefLabel = UILabel()
    private let sdefValue = UILabel()
    private let sdefBar:UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.layer.cornerRadius = 4
        progress.clipsToBounds = true
        return progress
    }()
    private let spdLabel = UILabel()
    private let spdValue = UILabel()
    private let spdBar:UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.layer.cornerRadius = 4
        progress.clipsToBounds = true
        return progress
    }()

    override func layoutSubviews() {
        setupStyles()
        addViews()
    }

    func setupMainColor(color: UIColor) {
        backgroundColor = .white
        hpLabel.textColor = color
        atkLabel.textColor = color
        defLabel.textColor = color
        satkLabel.textColor = color
        sdefLabel.textColor = color
        spdLabel.textColor = color
        hpBar.tintColor = color
        hpBar.trackTintColor = color.withAlphaComponent(0.2)
        atkBar.tintColor = color
        atkBar.trackTintColor = color.withAlphaComponent(0.2)
        defBar.tintColor = color
        defBar.trackTintColor = color.withAlphaComponent(0.2)
        satkBar.tintColor = color
        satkBar.trackTintColor = color.withAlphaComponent(0.2)
        sdefBar.tintColor = color
        sdefBar.trackTintColor = color.withAlphaComponent(0.2)
        spdBar.tintColor = color
        spdBar.trackTintColor = color.withAlphaComponent(0.2)
    }

    func setupStats(stats: [Stat]) {
        hpValue.text = String.formatStat(stat: stats[0].baseStat ?? 0)
        hpBar.setProgress(percentage(value: stats[0].baseStat ?? 0), animated: true)
        atkValue.text = String.formatStat(stat: stats[1].baseStat ?? 0)
        atkBar.setProgress(percentage(value: stats[1].baseStat ?? 0), animated: true)
        defValue.text = String.formatStat(stat: stats[2].baseStat ?? 0)
        defBar.setProgress(percentage(value: stats[2].baseStat ?? 0), animated: true)
        satkValue.text = String.formatStat(stat: stats[3].baseStat ?? 0)
        satkBar.setProgress(percentage(value: stats[3].baseStat ?? 0), animated: true)
        sdefValue.text = String.formatStat(stat: stats[4].baseStat ?? 0)
        sdefBar.setProgress(percentage(value: stats[4].baseStat ?? 0), animated: true)
        spdValue.text = String.formatStat(stat: stats[5].baseStat ?? 0)
        spdBar.setProgress(percentage(value: stats[5].baseStat ?? 0), animated: true)
    }

    private func percentage(value: Int) -> Float {
        return Float(value)/300
    }

    private func addViews() {
        addSubviews([baseLineSeparator, hpLabel, atkLabel, defLabel, satkLabel, sdefLabel, spdLabel, hpValue, atkValue, defValue, satkValue, sdefValue, spdValue, hpBar, atkBar, defBar, satkBar, sdefBar, spdBar])
        setupConstraints()
    }

    private func setupConstraints() {
        baseLineSeparator.topToTop(of: self, margin: 16*Dimen.heightMultiplier)
        baseLineSeparator.leadingToLeading(of: self, margin: 60*Dimen.widthMultiplier)
        baseLineSeparator.heightTo(100)
        baseLineSeparator.widthTo(1)

        hpLabel.trailingToLeading(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        hpLabel.topToTop(of: baseLineSeparator)
        hpValue.leadingToTrailing(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        hpValue.centerVertical(to: hpLabel)
        hpBar.leadingToTrailing(of: hpValue, margin: 8*Dimen.widthMultiplier)
        hpBar.trailingToTrailing(of: self, margin: Dimen.leadingMargin)
        hpBar.centerVertical(to: hpLabel)
        hpBar.heightTo(4)

        atkLabel.trailingToLeading(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        atkLabel.topToBottom(of: hpLabel, margin: 2)
        atkValue.leadingToTrailing(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        atkValue.centerVertical(to: atkLabel)
        atkBar.leadingToTrailing(of: atkValue, margin: 8*Dimen.widthMultiplier)
        atkBar.trailingToTrailing(of: self, margin: Dimen.leadingMargin)
        atkBar.centerVertical(to: atkLabel)
        atkBar.heightTo(4)

        defLabel.trailingToLeading(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        defLabel.topToBottom(of: atkLabel, margin: 2)
        defValue.leadingToTrailing(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        defValue.centerVertical(to: defLabel)
        defBar.leadingToTrailing(of: defValue, margin: 8*Dimen.widthMultiplier)
        defBar.trailingToTrailing(of: self, margin: Dimen.leadingMargin)
        defBar.centerVertical(to: defLabel)
        defBar.heightTo(4)

        satkLabel.trailingToLeading(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        satkLabel.topToBottom(of: defLabel, margin: 2)
        satkValue.leadingToTrailing(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        satkValue.centerVertical(to: satkLabel)
        satkBar.leadingToTrailing(of: satkValue, margin: 8*Dimen.widthMultiplier)
        satkBar.trailingToTrailing(of: self, margin: Dimen.leadingMargin)
        satkBar.centerVertical(to: satkLabel)
        satkBar.heightTo(4)

        sdefLabel.trailingToLeading(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        sdefLabel.topToBottom(of: satkLabel, margin: 2)
        sdefValue.leadingToTrailing(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        sdefValue.centerVertical(to: sdefLabel)
        sdefBar.leadingToTrailing(of: sdefValue, margin: 8*Dimen.widthMultiplier)
        sdefBar.trailingToTrailing(of: self, margin: Dimen.leadingMargin)
        sdefBar.centerVertical(to: sdefLabel)
        sdefBar.heightTo(4)

        spdLabel.trailingToLeading(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        spdLabel.topToBottom(of: sdefLabel, margin: 2)
        spdValue.leadingToTrailing(of: baseLineSeparator, margin: 8*Dimen.widthMultiplier)
        spdValue.centerVertical(to: spdLabel)
        spdBar.leadingToTrailing(of: spdValue, margin: 8*Dimen.widthMultiplier)
        spdBar.trailingToTrailing(of: self, margin: Dimen.leadingMargin)
        spdBar.centerVertical(to: spdLabel)
        spdBar.heightTo(4)
    }
}

extension StatsView: Stylable {
    func setupFonts() {
        hpLabel.font = .systemFont(ofSize: 12, weight: .heavy)
        atkLabel.font = .systemFont(ofSize: 12, weight: .heavy)
        defLabel.font = .systemFont(ofSize: 12, weight: .heavy)
        satkLabel.font = .systemFont(ofSize: 12, weight: .heavy)
        sdefLabel.font = .systemFont(ofSize: 12, weight: .heavy)
        spdLabel.font = .systemFont(ofSize: 12, weight: .heavy)
        hpValue.font = .systemFont(ofSize: 11)
        atkValue.font = .systemFont(ofSize: 11)
        defValue.font = .systemFont(ofSize: 11)
        satkValue.font = .systemFont(ofSize: 11)
        sdefValue.font = .systemFont(ofSize: 11)
        spdValue.font = .systemFont(ofSize: 11)
    }

    func setupColors() {
        baseLineSeparator.backgroundColor = .lightGray
    }

    func setupTexts() {
        hpLabel.text = "HP"
        atkLabel.text = "ATK"
        defLabel.text = "DEF"
        satkLabel.text = "SATK"
        sdefLabel.text = "SDEF"
        spdLabel.text = "SPD"
    }
}
