describe Packager::Executor do
  subject(:executor) { Packager::Executor.new(:dryrun => true) }

  it "handles a dependency" do
    item = Packager::Struct::Package.new(
      :name => 'foo',
      :version => '0.0.1',
      :type => 'test',
      :requires => [ 'foo' ],
    )
    executor.execute_on([item])
    expect(executor.commands[0]).to eq(
      Packager::Struct::Command.new({
        :name => 'foo',
        :version => '0.0.1',
        :source => 'empty',
        :target => 'test',
        :requires => [ 'foo' ],
      })
    )
  end
end